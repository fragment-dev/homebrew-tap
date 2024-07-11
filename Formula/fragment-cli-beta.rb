require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5382.0.0-darwin-x64.tar.gz"
    sha256 "8f3ca2e3ceaa157154a6907246c6bca28a35ca007018ebd551ec1492f3d6311b"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5382.0.0-darwin-arm64.tar.gz"
      sha256 "fab069edd82d747e9ef5f61909f833b5062c3e5f36c3018db43ba7ff9a1ab890"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5382.0.0-linux-x64.tar.gz"
    sha256 "b95170e1b250fb48167205062ec28b23764761fdb8813d61bac5c971c0aa264b"
  end
  version "5382.0.0"
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
