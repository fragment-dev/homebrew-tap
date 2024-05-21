require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5096.0.0-darwin-x64.tar.gz"
    sha256 "fc4f9c11e9cd90e4901e9ff471951ce6e2c8269f5b2ba43fd80073a881a7e20b"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5096.0.0-darwin-arm64.tar.gz"
      sha256 "11f797e623b40bd0be648e289eae59c4203569292158950ccd3b6eddd6abbe22"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5096.0.0-linux-x64.tar.gz"
    sha256 "47602bbc7711c778686a7fc4d377ba13a178702f81b255aa16ca8d301294b51e"
  end
  version "5096.0.0"
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
