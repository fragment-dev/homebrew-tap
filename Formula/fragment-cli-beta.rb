require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4531.0.0-darwin-x64.tar.gz"
    sha256 "7aa3444ee239910638fc31a2fab7439bb114d11a1ecb43d40f50f6b018be7cbd"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4531.0.0-darwin-arm64.tar.gz"
      sha256 "e27731bdb51c049837a5f088a5fda567fe4e4a5ce306d35c8f842a1ac50da00a"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4531.0.0-linux-x64.tar.gz"
    sha256 "4bc872b43cdaa735803231f91daba4673a10e795cf67e1a1d40c6ed7c81e525c"
  end
  version "4531.0.0"
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
