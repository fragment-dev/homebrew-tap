require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.11.30-darwin-x64.tar.gz"
    sha256 "c70205b653674d7691e02f32089f30d7b0621aa5f24ffeb87d1c9fa00f19cc39"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.11.30-darwin-arm64.tar.gz"
      sha256 "80e5817c24ee9644915627e0bcc7d4da166598a597affd67109524a52f36c726"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.11.30-linux-x64.tar.gz"
    sha256 "f69863828b7e10a711b1433915b3bb3ce9ff6d6ee92d66702770cb952ce0924d"
  end
  version "2023.11.30"
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
