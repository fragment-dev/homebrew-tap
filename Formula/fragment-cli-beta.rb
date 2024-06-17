require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5287.0.0-darwin-x64.tar.gz"
    sha256 "c8f4a5f16174b501679c88a5c46fc537481085846e0b358e834a431eaa3be673"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5287.0.0-darwin-arm64.tar.gz"
      sha256 "2352d99108c16a95fa0c3c6006fa92128e50152124888d93b9bf673a1ea1ce62"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5287.0.0-linux-x64.tar.gz"
    sha256 "6261ce98752ecbeec99d742502048c28eb79dd255ba41c375db32e6bb76e8821"
  end
  version "5287.0.0"
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
