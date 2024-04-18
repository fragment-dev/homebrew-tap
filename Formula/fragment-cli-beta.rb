require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4919.0.0-darwin-x64.tar.gz"
    sha256 "941e61294ed0550e488280b5cc142acfe451502538507bc5e58c5b6dcec6af69"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4919.0.0-darwin-arm64.tar.gz"
      sha256 "efe974a83df1c840da55f249d120730765a45d50a88936f94b9f87e3e15dd8d1"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4919.0.0-linux-x64.tar.gz"
    sha256 "71885508cd26bab1c074782f9e2286f113499add7fbb627f2447f40c01a8eed3"
  end
  version "4919.0.0"
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
