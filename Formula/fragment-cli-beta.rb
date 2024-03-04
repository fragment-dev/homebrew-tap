require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4702.0.0-darwin-x64.tar.gz"
    sha256 "2a5c5e82b17e0303118e9b61f5882baffa87cfe87deed9dde7cafceb1ab35f84"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4702.0.0-darwin-arm64.tar.gz"
      sha256 "9817d8dd4c37fce69f985ba0886e9db38f19a22c766e87b7f604f6394c84a325"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4702.0.0-linux-x64.tar.gz"
    sha256 "adeae1de29871aa4d27ccb42e77302decd0d8842d6b4b9cd6fe4f735fa363ccc"
  end
  version "4702.0.0"
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
