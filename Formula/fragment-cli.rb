require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.4.29-darwin-x64.tar.gz"
    sha256 "dbfc23793fef5b33631826af998182d20fc8fdca5b22b4203e38d390d138176d"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.4.29-darwin-arm64.tar.gz"
      sha256 "ba4f5ed4dd7470ab1ab4d0e250ada166795ebeb16fd7fb04a53dc0114c5cc2e8"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.4.29-linux-x64.tar.gz"
    sha256 "55e5edb15c81793d92ece99bd729814eb9ee9ca56733472c033a7a3ac6315c80"
  end
  version "2024.4.29"
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
