require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2734.0.0-darwin-x64.tar.gz"
    sha256 "c3bf698034447d14f30efd96b63168a9153a132888b0a010221f86b6be6c601f"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2734.0.0-darwin-arm64.tar.gz"
      sha256 "a4ed95959017b57b6346277ad50145e3094461388a6a3f21d89bdbb78220248c"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2734.0.0-linux-x64.tar.gz"
    sha256 "87f11d858e02d9969c818959a99efec1099aff44b5dce472dd23a4dd1c1d90a9"
  end
  version "2734.0.0"
  license "MIT"
  depends_on "node@16"

  def install
    inreplace "bin/fragment", /^CLIENT_HOME=/, "export FRAGMENT_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/fragment"
  end

  test do
    system bin/"fragment", "version"
  end
end
