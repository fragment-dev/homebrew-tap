require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2868.0.0-darwin-x64.tar.gz"
    sha256 "ae9f4456acf709f383542a2d3ee7c1c3c6bfb661b8489dc3603ddd3b9cb7f4b3"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2868.0.0-darwin-arm64.tar.gz"
      sha256 "7563899d0d1f33a7f9d78897b084cc5c1d9b1318526af24d025adc92e4fdbf6f"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2868.0.0-linux-x64.tar.gz"
    sha256 "cc42254684d2c8b73e233106dc0f2f4912d1be3a2cd735309753443dffa17bb7"
  end
  version "2868.0.0"
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
