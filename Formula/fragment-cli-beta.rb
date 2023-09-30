require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3728.0.0-darwin-x64.tar.gz"
    sha256 "445507ee6ef71dd18cbdd886c9600680de23f48469e610fb4b43a8daaa16f3b5"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3728.0.0-darwin-arm64.tar.gz"
      sha256 "bc3d49f04c78dd8e7e56a2c1ac1b086df07cfee3df9ebc1c00620cc05fae6074"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3728.0.0-linux-x64.tar.gz"
    sha256 "0c1823b77dbe075be24b97b584161d14dca664e007c81136aa474c386e10369f"
  end
  version "3728.0.0"
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
