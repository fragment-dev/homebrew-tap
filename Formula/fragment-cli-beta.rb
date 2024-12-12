require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5879.0.0-darwin-x64.tar.gz"
    sha256 "c24485fbcf082c6266a43bf309eeda91868e66f9508243c39b171d93b3fddf54"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5879.0.0-darwin-arm64.tar.gz"
      sha256 "ec0e24a6e53fe9f45ac1089f4d8ae1887fc70775a4800d3475223f09beaab954"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5879.0.0-linux-x64.tar.gz"
    sha256 "27ffed8621a96ed62574f961028e570d8dc0f9e38539e91207fc5dcfd9d1c24f"
  end
  version "5879.0.0"
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
