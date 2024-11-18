require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5785.0.0-darwin-x64.tar.gz"
    sha256 "0dfdcf6e462c8a51ab66e94e1fb1a81836c4425bd6ff0bcea62dd947411c1787"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5785.0.0-darwin-arm64.tar.gz"
      sha256 "7c1bf6c5a24c9e3908c6fca2bfe82dfb986c08917fbb3ad8b3b5df734c83cff5"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5785.0.0-linux-x64.tar.gz"
    sha256 "e0d921d0445ccf5e1547db840cb0866ea815d002991f7c6a172c29866331dffe"
  end
  version "5785.0.0"
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
