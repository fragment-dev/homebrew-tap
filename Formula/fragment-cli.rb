require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.1.19-1-darwin-x64.tar.gz"
    sha256 "3f0c2976e4db70aba8047178cb5bd5b64d41991e59a4e155cec12d455fa155b8"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.1.19-1-darwin-arm64.tar.gz"
      sha256 "712d558ef6deb9156128d7b9fb54943a2df52442f5a2c6e211d01baf7cdf7f80"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.1.19-1-linux-x64.tar.gz"
    sha256 "1af42d72f74574c37d7382e2cb86a6a39a4b541379e3a9b9aa4496bbda08866a"
  end
  version "2024.1.19-1"
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
