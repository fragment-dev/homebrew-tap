require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2320.0.0-darwin-x64.tar.gz"
    sha256 "d73b840ecdfd2f5a9b1436885e9eeb27c09951ed0a7e82b61d4fdb46acea2ca5"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2320.0.0-darwin-arm64.tar.gz"
      sha256 "f18d3ba3278c68ac3d716514d461a68a5d9aa6b4191fb6f6f7c8cc45e3b3aaf8"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2320.0.0-linux-x64.tar.gz"
    sha256 "c4b5d2523f86e9262ebf6fb331fbdd8bdef64df875f527faf15b3a31be7caa48"
  end
  version "2320.0.0"
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
