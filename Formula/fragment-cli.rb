require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.2.21-darwin-x64.tar.gz"
    sha256 "8ac830058aa90ea5d0f5301086018d001238217fc0fc99b4a9a6b1300723a103"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.2.21-darwin-arm64.tar.gz"
      sha256 "a4e13888db5f61c48637b85afcdbed35f10b211a59c02d0f1e6ff461c4823a30"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.2.21-linux-x64.tar.gz"
    sha256 "1bce1acf0a745e3ea65d6a87fb1014c4d00f6534eb2f82375f0d60fe225133ed"
  end
  version "2024.2.21"
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
