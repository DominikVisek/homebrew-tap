class Testovaci < Formula
  desc "test"
  url "https://github.com/DominikVisek/commands/archive/v0.0.1.tar.gz"
  sha256 "3ad3bfb6b8b57d56a4404b657dc72d51789256403bce5fdcdd9e8f67dcab526c"

  depends_on "go" => :build

  bottle do
    root_url "https://github.com/DominikVisek/commands/releases/tag/v0.0.1"
    cellar :any_skip_relocation
  end

  def install
      ENV["GOPATH"] = buildpath

      bin_path = buildpath/"src/github.com/dominikvisek/commands/cmd/ds"

      bin_path.install Dir["*"]

      Dir[buildpath/"src/github.com/dominikvisek/*"]
      Dir[buildpath/"src/github.com/dominikvisek/commands/*"]
      Dir[buildpath/"src/github.com/dominikvisek/commands/cmd/*"]
      Dir[buildpath/"src/github.com/dominikvisek/commands/cmd/ds/*"]

      cd bin_path do
            system "ls -alh"
            system "go", "build", "-o", bin/"ds", "."
      end
  end

  test do
    system "#{bin}/ds", "--version"
  end
end