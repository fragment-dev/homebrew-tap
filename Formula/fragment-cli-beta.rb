require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4183.0.0-darwin-x64.tar.gz"
    sha256 "48e062700c1ad55425959b05d4ea79a15187f0205c58f8ca89598bae2a36ef38"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4183.0.0-darwin-arm64.tar.gz"
      sha256 "a10f81cc149688c4a68030fb41b451c726f7004053284846c7eeaff24b161515"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4183.0.0-linux-x64.tar.gz"
    sha256 "e4346065d8ed0a5769c87e3cd78e4b47679cc7201aa82d7301ce77030bb9d811"
  end
  version "4183.0.0"
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
