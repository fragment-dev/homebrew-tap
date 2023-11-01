require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3955.1.0-darwin-x64.tar.gz"
    sha256 "4c54a17a59758e715a9d49b64168b6d78c0f6feb1c5d2c2021129e895302e37f"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3955.1.0-darwin-arm64.tar.gz"
      sha256 "f73406659c3306519c7b3d214932430acb351da150068d596db8d49873c05a94"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3955.1.0-linux-x64.tar.gz"
    sha256 "c9e63a63b46b9802ceabcb60e3340dcddd530615134ed32473046575bbb31399"
  end
  version "3955.1.0"
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
