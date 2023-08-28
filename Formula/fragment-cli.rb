require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.8.28-darwin-x64.tar.gz"
    sha256 "5fc7e9bc0238a00440dc90aa72935a53c6547038b1e57006731db010f4bb5a70"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.8.28-darwin-arm64.tar.gz"
      sha256 "baed869cca3a7f805e08f9cdddeb6c5d0fb3b7aad841faa2a3819f5f2764bf57"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.8.28-linux-x64.tar.gz"
    sha256 "8466a22120f76735f31110cf304368b07a9e0436f53fba0c2b5e5f586a317321"
  end
  version "2023.8.28"
  license "MIT"
  depends_on "node@16"

  def install
    inreplace "bin/fragment", /^CLIENT_HOME=/, "export FRAGMENT_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/fragment"
  end

  test do
    system bin/"fragment", "version"
  end
end
