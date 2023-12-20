require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.12.20-darwin-x64.tar.gz"
    sha256 "6525f49869f03b1fbec20e61efcf07e4ba02ed497c4546e33b6f0076341ba736"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.12.20-darwin-arm64.tar.gz"
      sha256 "ddaaa5bfe99516ac6ea0f15a1cec624454288588489924fbf6bb43a01ead0702"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.12.20-linux-x64.tar.gz"
    sha256 "64fff17030f303aa66cc4432fa193995c2be5026c12e0520b38176f8fb9092ed"
  end
  version "2023.12.20"
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
