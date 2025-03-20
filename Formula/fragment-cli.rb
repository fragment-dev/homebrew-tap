require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2025.3.19-2-darwin-x64.tar.gz"
    sha256 "f3bcee34b57153a597b660132a308bc5e3d64146f4a69d8651a5e9c5dd0a3d1c"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2025.3.19-2-darwin-arm64.tar.gz"
      sha256 "8839858d5353a7403bcf7b755732c3406249be51895ceea3cc93d302e5c53ee8"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2025.3.19-2-linux-x64.tar.gz"
    sha256 "0d767a2ab2f6795b3d421a781902551934695795ee5aa8b78027c6b79d197050"
  end
  version "2025.3.19-2"
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
