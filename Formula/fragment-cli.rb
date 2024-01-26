require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.1.26-darwin-x64.tar.gz"
    sha256 "e57345a9845114316e0a2f20efabe086e0d70ef38be2ffd9936134efe1c827c0"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.1.26-darwin-arm64.tar.gz"
      sha256 "315b275ea202d2825eaee7bb2e96fe39bd5791f477fc164f855aa14b7cdb7bd4"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.1.26-linux-x64.tar.gz"
    sha256 "c467642292f6b369c9605182c97e185ce87cec96de93b63d9783ac32ac342f63"
  end
  version "2024.1.26"
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
