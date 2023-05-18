require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2695.0.0-darwin-x64.tar.gz"
    sha256 "f2a237107e91cf0d9d22c71f0455e31826483a4c73dfe22311436d71b47eb1c6"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2695.0.0-darwin-arm64.tar.gz"
      sha256 "af658ef27376c071577b7b6b8f240fa723441e825e329dd5ea8aad34c8bfebcd"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2695.0.0-linux-x64.tar.gz"
    sha256 "4d2a08622c396bdebb72f2fa737467f5d1d9c8b852dd80c0438e819687b2c394"
  end
  version "2695.0.0"
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
