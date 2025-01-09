require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2025.1.9-1-darwin-x64.tar.gz"
    sha256 "ab8c5a1e17ad1c911cdf24076c6ae9c70d4c52c2440d7738c3ef886205e1354d"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2025.1.9-1-darwin-arm64.tar.gz"
      sha256 "fd5ad87839e8d632dd3b3325c2b96e800f9ce89f42b27a8723bca46168529e3f"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2025.1.9-1-linux-x64.tar.gz"
    sha256 "d84f31f099b620e1d32cfc4e7671d7fdb0fbc467787293d4f295f06e792373e8"
  end
  version "2025.1.9-1"
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
