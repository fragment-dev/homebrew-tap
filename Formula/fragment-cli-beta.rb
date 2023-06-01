require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2778.0.0-darwin-x64.tar.gz"
    sha256 "5103008ec2646945afd6cbdc6bee6e64197fc63f4daaff1632edd7d0fc3424a3"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2778.0.0-darwin-arm64.tar.gz"
      sha256 "7744adaf3d4890a7b42809abae4a425f8fbb9db14b116bf048c550f0177d774a"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2778.0.0-linux-x64.tar.gz"
    sha256 "6c6405399da27464ef51a59948842e8bbaa5aa1909314e0401dec9327b64635d"
  end
  version "2778.0.0"
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
