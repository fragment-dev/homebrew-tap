require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6095.0.0-darwin-x64.tar.gz"
    sha256 "9f0c507f9805bf5b991b3207cec0332e3066e0d2f8ac69000affdc41e042ab7d"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6095.0.0-darwin-arm64.tar.gz"
      sha256 "5234d188a3fa6e551957f3e8156d38ea2023bc9c6695cce77f597653fba44f32"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6095.0.0-linux-x64.tar.gz"
    sha256 "46e0331bc72817ca3fc2edb12a1aab3012ee0d85f8d67197de5f08ef95be67bd"
  end
  version "6095.0.0"
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
