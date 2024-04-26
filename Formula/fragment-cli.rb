require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.4.26-1-darwin-x64.tar.gz"
    sha256 "48d9cf03cc336a556e430acfedb2252d3befdca406734ae7c59431e3f09dcbd5"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.4.26-1-darwin-arm64.tar.gz"
      sha256 "5624c698ca876b230d348f67481b8ad54f1d47d7147564eb5214d4861e3f318e"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.4.26-1-linux-x64.tar.gz"
    sha256 "77e81a1ce6b14c6e2c3ce423d7bf20562a3f7e2e8d758c22cd7c09cdd223343b"
  end
  version "2024.4.26-1"
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
