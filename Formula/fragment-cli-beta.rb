require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4158.0.0-darwin-x64.tar.gz"
    sha256 "c959e4d9f42a1f92087d70c1a9c7f2cc80d36c698fb5249490f2486c849a7638"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4158.0.0-darwin-arm64.tar.gz"
      sha256 "ae725b71f47fc4b3ac4012de07186bd26e2a9735bf6c0d797aa35f6646d91f61"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4158.0.0-linux-x64.tar.gz"
    sha256 "7c2d058193cae2147c341ada71fc9828ff34d8bfc4e18c548da7fc9b56874090"
  end
  version "4158.0.0"
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
