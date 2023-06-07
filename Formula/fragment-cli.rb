require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.6.7-darwin-x64.tar.gz"
    sha256 "d755489392d9c11f42872ccf53326aca899bb0c5e867d1e78ff552f7bbc6b7d1"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.6.7-darwin-arm64.tar.gz"
      sha256 "b8ab90c55bf7f349156a7005584bb3b6abe2aad4624e8fef3e33046d21a356bc"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.6.7-linux-x64.tar.gz"
    sha256 "c98f0d06cc37e50a2f2ecdd865c0c83f42bea9a81eaea3e9bc0ac922c0e47e8c"
  end
  version "2023.6.7"
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
