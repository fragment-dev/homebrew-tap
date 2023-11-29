require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4063.0.0-darwin-x64.tar.gz"
    sha256 "2611c6bd53d35affb80487af7aa9a19eb52d88528fb9dd05051ef549584bc87c"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4063.0.0-darwin-arm64.tar.gz"
      sha256 "a672e5d7837abbd9ab96d60591cd63b7fd393e5efa9d6d123d876106af8b0f9f"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4063.0.0-linux-x64.tar.gz"
    sha256 "6722d812449db1355bee5363a5c7d7796cbb0073c3f970331b0c27619468411e"
  end
  version "4063.0.0"
  license "MIT"
  depends_on "node@18"

  def install
    inreplace "bin/fragment", /^CLIENT_HOME=/, "export FRAGMENT_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/fragment"
  end

  test do
    system bin/"fragment", "version"
  end
end
