require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.11.16-darwin-x64.tar.gz"
    sha256 "6a8f3a8e33b0dad72046ff1f20bc7c7e886815ee1a8e87f669911f6949e85bb1"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.11.16-darwin-arm64.tar.gz"
      sha256 "3b54c5f026443aca91cc99ccb6b1b5aa84f259a1c5e642fd4fa583a3764432a9"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.11.16-linux-x64.tar.gz"
    sha256 "86ac295383cde9ed6b52ba684464c722e91a34dab35f4cea2bc8c6f76024d491"
  end
  version "2023.11.16"
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
