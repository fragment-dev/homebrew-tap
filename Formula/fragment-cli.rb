require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.2.29-darwin-x64.tar.gz"
    sha256 "2f0927b00ee9ec6a39e78cccd9b37e7449405671015fe50dff64d9f02ae2a51d"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.2.29-darwin-arm64.tar.gz"
      sha256 "a6c4b8edbb263075b24c624480bd7aaf80c56a5bf0552425cdcfc0d8ab41bd68"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.2.29-linux-x64.tar.gz"
    sha256 "1cb121d5eb851453d3edf3f8d901ad9f6de124cd769fd8546b64a939d4d0652d"
  end
  version "2024.2.29"
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
