require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4811.0.0-darwin-x64.tar.gz"
    sha256 "0c6d961ecf47564ff0dfc69c96f1ecce87014a81d8926866050aacbbd81fa0fa"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4811.0.0-darwin-arm64.tar.gz"
      sha256 "62b1b925c3667d35346b1bb9380c33b08ce3fdd4a81574593191158a58cd8924"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4811.0.0-linux-x64.tar.gz"
    sha256 "d1c83245ddb6c18abb2d6f61832500e1831d938a1164e5867aad0afec3bc6de4"
  end
  version "4811.0.0"
  license "MIT"
  depends_on "node@20"

  def install
    inreplace "bin/fragment", /^CLIENT_HOME=/, "export FRAGMENT_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/fragment"
  end

  test do
    system bin/"fragment", "version"
  end
end
