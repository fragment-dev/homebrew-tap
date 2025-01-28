require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2025.1.27-darwin-x64.tar.gz"
    sha256 "42c181d93aa1666957d764a14a3dc7766bfbb72e2bf162608750fb98613c29a3"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2025.1.27-darwin-arm64.tar.gz"
      sha256 "6a6f61534678467de819e251c41281e48ba8f0e8f167546ccd173794976d1dea"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2025.1.27-linux-x64.tar.gz"
    sha256 "73645bbbf56c6eeba9a65d360b481c904b5ae082c140a40b47aa01c20d1c71c9"
  end
  version "2025.1.27"
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
