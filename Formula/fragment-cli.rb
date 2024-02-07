require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.2.7-darwin-x64.tar.gz"
    sha256 "8700af6136f0beb8262ee53456eb88ae6768101cb057236bfedf734af83b5795"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.2.7-darwin-arm64.tar.gz"
      sha256 "9eff7cec894fa357555bd9d2cc2f95c61a40cfff83ac1f3ee3f2a522254c0bd8"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.2.7-linux-x64.tar.gz"
    sha256 "0dfb678d2fe4bc563b22d157f1cd35a05519721221eb53f7936a9ad455bec976"
  end
  version "2024.2.7"
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
