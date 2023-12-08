require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4120.0.0-darwin-x64.tar.gz"
    sha256 "1d00948b4b81df74af52612e7b1630265fc4a0ede8368590427aa1af91e89a6f"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4120.0.0-darwin-arm64.tar.gz"
      sha256 "f67ea6d743cbcbc1e72c79087d38dd16239b024fcb40d290bd219f21a4e5f9cc"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4120.0.0-linux-x64.tar.gz"
    sha256 "1fa5f8d88dd6adc45ab22b3a0fcfbb942d84081c783a25075fa698628215a987"
  end
  version "4120.0.0"
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
