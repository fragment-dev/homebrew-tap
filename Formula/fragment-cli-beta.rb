require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5692.0.0-darwin-x64.tar.gz"
    sha256 "04e2875db82337ee2380c1e6ee9a6060f6d6445a2600840200a8e39c211ab947"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5692.0.0-darwin-arm64.tar.gz"
      sha256 "a68e77ebc17add4887d5da3d5f83ba79899a62013cb74ace9f1df5de9a7d937c"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5692.0.0-linux-x64.tar.gz"
    sha256 "738e46f5daef11c8e65875c7dc3b8fea9e1efb4295769753a380f1c4f4cde0bb"
  end
  version "5692.0.0"
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
