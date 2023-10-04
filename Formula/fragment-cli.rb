require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.10.3-1-darwin-x64.tar.gz"
    sha256 "4db9326dc5c5a381341bc7126fd54e88a8d6553ec6b7a409baa7f41061d7b63f"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.10.3-1-darwin-arm64.tar.gz"
      sha256 "b4a050251fd026d97fbee39356b781895ff557fdcad93aa1cd8725bb375f35c7"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.10.3-1-linux-x64.tar.gz"
    sha256 "7c94679ce913196a932243a28d58227e4ae8a1bd03b25ce934f6b35d9ce1bfb2"
  end
  version "2023.10.3-1"
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
