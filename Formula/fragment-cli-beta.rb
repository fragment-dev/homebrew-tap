require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2515.0.0-darwin-x64.tar.gz"
    sha256 "cd0fd5f1dd90e313f65c94e95dbe685671a5d06162af55df0eafb330a4f256bf"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2515.0.0-darwin-arm64.tar.gz"
      sha256 "cdeda07bb9f9017379a65a4f3920d43ccd2dc5646fa379bd27871e9468077ef8"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2515.0.0-linux-x64.tar.gz"
    sha256 "fc3578052a9bcf6209b0600f15867366de61f41445ab6faa8cf33d991c07355c"
  end
  version "2515.0.0"
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
