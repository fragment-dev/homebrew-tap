require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.6.12-1-darwin-x64.tar.gz"
    sha256 "9267f3f64105cd617f8b7664e659098e9c9695e84f17aed48678e4f62e28faf8"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.6.12-1-darwin-arm64.tar.gz"
      sha256 "f9de902c322149b5f4651a4f5615b6fb72873fb776d79f80531d1b319e8a985f"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.6.12-1-linux-x64.tar.gz"
    sha256 "8f6bb76cab96fa536e6c03275f32238e61f6062cdfbe0229020f20c7ddf190a4"
  end
  version "2024.6.12-1"
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
