require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4335.0.0-darwin-x64.tar.gz"
    sha256 "86bf8117f45dab8cf31cef819da0882566f3ecd5d6702f1ef2564753e3d91c4a"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4335.0.0-darwin-arm64.tar.gz"
      sha256 "54d5963b36d3908a78cb74a1f67a157c09a98789f02a4fb46f8e58aefc345d9d"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4335.0.0-linux-x64.tar.gz"
    sha256 "20f08c0c279510b7405ba5b64a398bd29468f18ec453f78cf5edfaadc546b656"
  end
  version "4335.0.0"
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
