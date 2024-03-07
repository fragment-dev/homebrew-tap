require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.3.6-1-darwin-x64.tar.gz"
    sha256 "45504919290a314b9db90fe5a8d93b827593d00b9f406c13e25b68e173ee9320"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.3.6-1-darwin-arm64.tar.gz"
      sha256 "11feb56888b3b3ea4f88c3ea9ce4b19069fcc0449a9bbd8e9092bc79789f0ef8"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.3.6-1-linux-x64.tar.gz"
    sha256 "8cb14240f8caf658ea03e562214e639590385e6d005f3718ac79fc72c9c3e554"
  end
  version "2024.3.6-1"
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
