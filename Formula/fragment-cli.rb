require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.10.23-darwin-x64.tar.gz"
    sha256 "ab56ab732ed7aab3f1dbba1d1c01af2dd95a69b23d715383142a9c8fa032d9f6"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.10.23-darwin-arm64.tar.gz"
      sha256 "e99695746b55370c05cadb575486ebc5234b9d22c71fd39507a8acac617ede1b"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.10.23-linux-x64.tar.gz"
    sha256 "9ccabcb4ecaa8a8953a6d1a3bdf4aabad64afe5a01cf0c237e9d67d210ce47c8"
  end
  version "2024.10.23"
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
