require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v1943.0.0-darwin-x64.tar.gz"
    sha256 "77695b6d18a3942dda2c2698a2138b7fca4e7acca6856f9fbf209636fb3b1336"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v1943.0.0-darwin-arm64.tar.gz"
      sha256 "d4f17becdd71e189f8469bc0e5a04ca7159dda8ffc2fe89061592fd9c844df4d"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v1943.0.0-linux-x64.tar.gz"
    sha256 "72a21c9fc166612d05d73c3720f8375b9efaa1072ae63c95f725c7eabb165dd5"
  end
  version "1943.0.0"
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
