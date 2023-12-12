require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4137.0.0-darwin-x64.tar.gz"
    sha256 "b7d83a14bd39dc159698ac6b621fb4fe246bd6755e8e05115f19bb8f8544bb39"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4137.0.0-darwin-arm64.tar.gz"
      sha256 "e8ca401573ae45851e989ca5e7d31df1faf820050fdcc68e771c111817ee060e"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4137.0.0-linux-x64.tar.gz"
    sha256 "ed92a63a42f77f0203992e4526fa0ca08baea6f831d7f8028349339384da4120"
  end
  version "4137.0.0"
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
