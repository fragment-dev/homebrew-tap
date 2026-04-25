require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2026.4.23-2-darwin-x64.tar.gz"
    sha256 "106cc7efc671c3164263204c1dac5ee48f0523d5f8489f8fafe1d2da4923a620"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2026.4.23-2-darwin-arm64.tar.gz"
      sha256 "c5e20f4c9fee0f136acee8a93613165a597bc8cdcfaf3616c86cab212bd9bf51"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2026.4.23-2-linux-x64.tar.gz"
    sha256 "966174c3cd523c6bc379bd81f6adbfae8038cac4c03ce53c3f440bffbd31f5c7"
  end
  version "2026.4.23-2"
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
