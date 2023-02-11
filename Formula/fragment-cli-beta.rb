require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v1983.0.0-darwin-x64.tar.gz"
    sha256 "5b10b0f8929f107d5ccfaf1789cc9038b11a4825c33cef5349ced5ec0735c80e"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v1983.0.0-darwin-arm64.tar.gz"
      sha256 "b93ca39fd3730ff12e452de385262ca307e5377b0126a2df25dca4b42ede2c8a"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v1983.0.0-linux-x64.tar.gz"
    sha256 "d36967683039b8f0fb08019e835f0f6f3292c244e8fd6f05ed6e960beb585991"
  end
  version "1983.0.0"
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
