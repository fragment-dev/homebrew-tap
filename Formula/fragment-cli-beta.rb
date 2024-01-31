require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4465.0.0-darwin-x64.tar.gz"
    sha256 "6aa3f9df1451bea79633fe1ca54e26ec0a07816f40fa0b3a36a344e96007b841"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4465.0.0-darwin-arm64.tar.gz"
      sha256 "c2a404d9ae36d8b5c80378037078f7bad647aaf4497aea65f0679936337887e0"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4465.0.0-linux-x64.tar.gz"
    sha256 "5ea3b023edaaadbd3b14e733cb4ecf6b07800eefee4145926aa4228f8b6060d4"
  end
  version "4465.0.0"
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
