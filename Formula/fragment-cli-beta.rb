require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4066.0.0-darwin-x64.tar.gz"
    sha256 "caa24038a528bca8484ec6b5af96122d6e99a85637962c94f74e52680580f313"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4066.0.0-darwin-arm64.tar.gz"
      sha256 "c8b71a3db45e1cbf144cd1ee7fa61dc5be04a07ea92cc3b105b423035f146356"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4066.0.0-linux-x64.tar.gz"
    sha256 "51af5e44bbc725cdb4a1d7494e5232e68887fc1d4138f980f39802149e311494"
  end
  version "4066.0.0"
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
