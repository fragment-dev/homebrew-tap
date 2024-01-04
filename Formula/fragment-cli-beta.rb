require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4273.0.0-darwin-x64.tar.gz"
    sha256 "326fbcfc2ccd4915b2b4a9bcb8de06e4d84df932240f8f7ecdb4032a59f710ae"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4273.0.0-darwin-arm64.tar.gz"
      sha256 "1de67ee2faadb2ecd1901c2193ff0e3f80b4b70c989eb0dca6eed952b70e0c7a"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4273.0.0-linux-x64.tar.gz"
    sha256 "ed628b29705fc0d91cb4c845945aad65de9ae856d586e1b6a3db8b4ad3466bc3"
  end
  version "4273.0.0"
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
