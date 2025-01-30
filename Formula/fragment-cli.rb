require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2025.1.29-darwin-x64.tar.gz"
    sha256 "969f68162b68045cf69ea92f917f2054ecbce90cc8b343ff369aab90314405e7"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2025.1.29-darwin-arm64.tar.gz"
      sha256 "bafd52d1d869f7349fe2faa77a8a10e0e5088b6694fcae43769305e31da543a2"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2025.1.29-linux-x64.tar.gz"
    sha256 "508c8219150143357f6a5a849e24c5e61e386e99759aa81def87754c4ecfd11c"
  end
  version "2025.1.29"
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
