require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.5.8-darwin-x64.tar.gz"
    sha256 "8c547ac02276a693eeab38b901a1d542cbcfba8e4eda2247462b655761fcaabb"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.5.8-darwin-arm64.tar.gz"
      sha256 "9421c65ccc4989f32e2f2a68d4b365967f3c783ea330044880db5602585b8ab4"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.5.8-linux-x64.tar.gz"
    sha256 "56a2690225decae4ad4ac836538f7d836462439843cf2e72de86eda80ec94457"
  end
  version "2024.5.8"
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
