require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4558.0.0-darwin-x64.tar.gz"
    sha256 "199166f4f7159a41cd80f4f529aa983c41b25efdf67661ca0530b98949a2f78a"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4558.0.0-darwin-arm64.tar.gz"
      sha256 "f72b00841551167d593e5c895d0404067dfef7f0fbb932d4e81710f84d4720f9"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4558.0.0-linux-x64.tar.gz"
    sha256 "8e7e32880bfae3f1b2ccac9e1c2d62c80ddb4c25e67368f6d65548d0b8c5181b"
  end
  version "4558.0.0"
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
