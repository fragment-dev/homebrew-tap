require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4075.0.0-darwin-x64.tar.gz"
    sha256 "8de9420db90b5e8b9a52df550cdca404d36c989b32ddec51b492aa44ea0e55d4"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4075.0.0-darwin-arm64.tar.gz"
      sha256 "7d30bfbb4d2da16545ac186b38947e996fe298b055cfcabe7fee580f65428212"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4075.0.0-linux-x64.tar.gz"
    sha256 "3d54484577c6cca19b472d2f7ff6db32d82181701152a668132366a167a6281b"
  end
  version "4075.0.0"
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
